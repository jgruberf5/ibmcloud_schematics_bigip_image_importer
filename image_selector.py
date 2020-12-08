#!/usr/bin/env python

import sys
import json
import urllib3
import difflib

ALLOWED_TMOS_TYPES = ['all', 'ltm']
PUBLIC_REGIONS = ['us-south', 'us-east', 'eu-gb', 'eu-de', 'jp-tok', 'au-syd']


def get_public_images(region):
    if not region:
        region = 'us-south'
    catalog_url = "https://f5-adc-%s.s3.%s.cloud-object-storage.appdomain.cloud/f5-image-catalog.json" % (
        region, region)
    try:
        http = urllib3.PoolManager()
        response = http.request('GET', catalog_url)
        return json.loads(response.data)
    except Exception as ex:
        sys.stderr.write(
            'Can not fetch F5 image catalog at %s: %s' % (catalog_url, ex))
        sys.exit(1)


def longest_substr(type, catalog_image_name, version_prefix):
    if catalog_image_name.find(type) < 0:
        return 0
    if catalog_image_name.find(version_prefix) < 0:
        return 0
    seqMatch = difflib.SequenceMatcher(None, catalog_image_name, version_prefix)
    match = seqMatch.find_longest_match(
        0, len(catalog_image_name), 0, len(version_prefix))
    return match.size


def main():
    for line in {x.strip() for x in sys.stdin}:
        if line:
            jsondata = json.loads(line)
            tmos_type = jsondata['type'].lower()
            if tmos_type not in ALLOWED_TMOS_TYPES:
                sys.stderr.write('TMOS type must be in: %s' %
                                 ALLOWED_TMOS_TYPES)
                sys.exit(1)
            tmos_version_match = jsondata['version_prefix'].lower().replace('.','-')
            region = jsondata['download_region'].lower()
            if region not in PUBLIC_REGIONS:
                region = 'us-south'
            image_catalog = get_public_images(region)
            max_match = 0
            image_url = None
            image_name = None
            for image in image_catalog[region]:
                match_length = longest_substr(tmos_type, image['image_name'], tmos_version_match)
                if match_length >= max_match:
                    max_match = match_length
                    image_url = image['image_sql_url']
                    image_name = image['image_name']
            if not image_url:
                sys.stderr.write(
                    'No image in the public image catalog matched version %s' % tmos_version_match)
                sys.exit(1)
            jsondata['image_sql_url'] = image_url
            jsondata['image_name'] = image_name
            sys.stdout.write(json.dumps(jsondata))
    sys.stderr.write(
        'type, download_region, verion_prefix inputs require to query public f5 images')
    sys.exit(1)


if __name__ == '__main__':
    main()

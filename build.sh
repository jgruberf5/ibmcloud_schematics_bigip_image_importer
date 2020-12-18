#!/bin/bash
rm ibmcloud_schematics_bigip_image_importer.zip
zip -r ibmcloud_schematics_bigip_image_importer.zip  . -x '*.git*'


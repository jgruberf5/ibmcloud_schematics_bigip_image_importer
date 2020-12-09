# ibmcloud_schematics_bigip_image_importer

Import a public F5 TMOS Virtual Edition Image into a VPC

Use this template to import F5 TMOS images into your IBM Cloud account in IBM Cloud [VPC Gen2](https://cloud.ibm.com/vpc-ext/overview) by using Terraform or IBM Cloud Schematics.  Schematics uses Terraform as the infrastructure-as-code engine.  With this template, you can create and manage infrastructure as a single unit as follows. For more information about how to use this template, see the IBM Cloud [Schematics documentation](https://cloud.ibm.com/docs/schematics).

*This template requires the use of Schematics Terraform 0.12*

## IBM Cloud IaaS Support

You're provided free technical support through the IBM Cloud™ community and Stack Overflow, which you can access from the Support Center. The level of support that you select determines the severity that you can assign to support cases and your level of access to the tools available in the Support Center. Choose a Basic, Advanced, or Premium support plan to customize your IBM Cloud™ support experience for your business needs.

Learn more: https://www.ibm.com/cloud/support

## Prerequisites

- Have access to [Gen 2 VPC](https://cloud.ibm.com/vpc-ext/).

Public BIG-IP™ images available on IBM Cloud are:

**User variable:** ```region```

The region to make your VPC Custom Image available.

This is not required and will default to ```us-south```

**User variable:** ``download_region``

The public VPC region from which to import the image using the public COS URL

This is not required and will default to ```us-south```.

**Values:**

- ```us-east```
- ```us-south```
- ```eu-gb```
- ```eu-de```
- ```jp-tok```
- ```au-syd```

**User variable:** ```vpc_image_name```

**Values:**

The name to give your VPC Custom Image. This must be unique in the VPC region. It must be a valid IBM VPC object name.

This is not required and will default to the F5 VE Image naming scheme for the image you selected.

**User variable:** ```tmos_version```

**Values:**

This can be simply the major release number, or a major.minor release number. The longest match of the TMOS VE version in the public catalog will be use for the image.

As an example, for TMOS version 15, you can simply specify ```15```, but to force version 15.1.2 you could specifiy ```15.1.2```.

This is not required and will default to ```15.1```.

**User Variable:** ```tmos_image_type```

**Values:**

- ```ltm```
- ```all```

This will specifiy if you want an LTM 1SLOT or an ALL 1SLOT image.

This is not required and will default to ```ltm```.

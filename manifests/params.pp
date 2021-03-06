class windowstraininglab::params (
  $students = {
    'testing' => {
       'accountname' => 'testing',
       'fullname'    => 'testing lastname',
       'password'    => 'P@ssw0rd!',
    },
    'moretest' => {
       'accountname' => 'moretest',
       'fullname'    => 'moretest lastname',
       'password'    => 'P@ssw0rd!',
    }
  }
) {

  case $::ec2_region {
    # North America
    'us-west-2': {
      $security_groups = ['tse-agents','tse-crossconnect']
      $windows2012 = 'ami-4dbcb67d'
      $windows7 = 'ami-4dbcb67d'
    }
    # Singapore
    'ap-southeast-1': {
      $security_groups = ['tse-agents','tse-crossconnect']
      $windows2012 = 'ami-ae7c41fc'
      $windows7 = 'ami-ae7c41fc'
    }
    # Sydney
    'ap-southeast-2': {
      $security_groups = ['tse-agents','tse-crossconnect']
      $windows2012 = 'ami-dd1b6be7'
      $windows7 = 'ami-dd1b6be7'
    }
    # Europe
    # UK + Ireland
    'eu-west-1': {
      $security_groups = ['tse-agents','tse-crossconnect']
      $windows2012 = 'ami-5d62ff2a'
      $windows7 = 'ami-5d62ff2a'
    }
    default: {
      fail("This module is only meant for aws, ec2_regions: us-west-2, ap-southeast-2, eu-west-1")
    }
  }

  case $::ec2_placement_availability_zone {
    'us-west-2a', 'ap-southeast-2a', 'eu-west-1a': {
      $subnet = 'tse-subnet-avza-1'
    }
    'us-west-2b', 'ap-southeast-2b', 'eu-west-1b': {
      $subnet = 'tse-subnet-avzb-1'
    }
    default: {
      fail("This module is only meant for aws, ec2_regions: us-west-2, ap-southeast-2, eu-west-1")
    }
  }
}

define windowstraininglab::ec2instance (
  $nodename = $name,
  $availablility_zone = $::ec2_placement_availability_zone,
  $image_id,
  $region = $::ec2_region,
  $instance_type = 'm3.medium',
  $security_groups = $windowstraininglab::params::security_groups,
  $subnet = $windowstraininglab::params::subnet,
  $pe_version_string = $::pe_version,
  $pp_project = 'TrainingLab',
  $pp_created_by,
  $pp_department = 'TSE',
  $key_name,
  $pe_master_hostname,
) {

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_id,
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'project'       => $pp_project,
      'created_by'    => $pp_created_by,
      'department'    => $pp_department,
    },
    user_data         => template('windowstraininglab/windows.erb'),
  }
}

# Class: inspector
# ===========================
#
# Download and install the AWS Inspector agent.
#
# Authors
# -------
#
# Todd Courtnage <todd@chaordix.com >
#
# Copyright
# ---------
#
# Copyright 2016 Todd Courtnage
#
class inspector {
  include inspector::params

  if $region {
    validate_string($region)
  }

  include inspector::install
  include inspector::service

  Class['inspector::install'] -> Class['inspector::service']
}

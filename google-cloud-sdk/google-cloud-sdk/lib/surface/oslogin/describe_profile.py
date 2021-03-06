# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Implements the command for SSHing into an instance."""
from googlecloudsdk.api_lib.oslogin import client
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.util import gaia


@base.ReleaseTracks(base.ReleaseTrack.ALPHA)
class DescribeProfile(base.Command):
  """Describe the OS Login profile for the current user."""

  def __init__(self, *args, **kwargs):
    super(DescribeProfile, self).__init__(*args, **kwargs)

  def Run(self, args):
    """See ssh_utils.BaseSSHCLICommand.Run."""
    oslogin_client = client.OsloginClient(self.ReleaseTrack())
    user_email = gaia.GetAuthenticatedGaiaEmail(oslogin_client.client.http)
    return oslogin_client.GetLoginProfile(user_email)


DescribeProfile.detailed_help = {
    'brief': 'Describe the OS Login profile for the current user.',
    'DESCRIPTION': """\
      *{command}* displays the OS Login profile for the currently
      authenticated user, including Posix accounts and SSH keys
      associated with the user.
      """
}

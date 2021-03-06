# encoding: utf-8
#
# Redmine plugin for Document Management System "Features"
#
# Copyright © 2011-18 Karel Pičman <karel.picman@kontron.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require File.expand_path('../../../test_helper', __FILE__)

class DmsfWebdavCustomMiddlewareTest < RedmineDmsf::Test::IntegrationTest

  def setup
    Setting.plugin_redmine_dmsf['dmsf_webdav'] = '1'
  end

  def test_options_for_root_path
    xml_http_request  :options, '/'
    assert_response :success
  end

  def test_options_for_dmsf_root_path
    xml_http_request  :options, '/dmsf'
    assert_response :success
  end

  def test_webdav_not_enabled
    Setting.plugin_redmine_dmsf['dmsf_webdav'] = nil
    xml_http_request  :options, '/dmsf/webdav'
    assert_response 404
  end

end

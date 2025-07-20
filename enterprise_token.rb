############ If you are using DOCKER all-in-one image, create Dockerfile like:         ################
############ FROM openproject/openproject:16                                           ################
############ COPY ./enterprise_token.rb app/models/enterprise_token.rb                 ################

############ If you are runing a manual installation:                                  ################
############ REPLACE app/models/enterprise_token.rb in the source code with this file! ################
############ also be sure to RESTART OpenProject after replacing the file.             ################

############ If using some other set up (eg docker-compose), read the comments on      ################
############ https://gist.github.com/markasoftware/f5b2e55a2c2e3abb1f9eefcdf0bfff45    ################

# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
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
#
# See COPYRIGHT and LICENSE files for more details.
#++
class EnterpriseToken < ApplicationRecord
  class << self
    def current
      self.new
    end

    def allows_to?(feature)
      true
    end

    def active?
      true
    end

    def hide_banners?
      true
    end

    def show_banners?
      false
    end

    def banner_type_for(feature:)
      nil
    end
  end

  def token_object
    Class.new do
      def has_feature?(feature)
        true
      end

      def will_expire?
        false
      end

      def mail
        "admin@example.com"
      end

      def subscriber
        "markasoftware-free-enterprise-mode"
      end

      def company
        "markasoftware"
      end

      def domain
        "markasoftware.com"
      end

      def issued_at
        Time.zone.today - 1
      end

      def starts_at
        Time.zone.today - 1
      end

      def expires_at
        Time.zone.today + 1
      end

      def reprieve_days
        nil
      end

      def reprieve_days_left
        69
      end

      def restrictions
        nil
      end

      def available_features
        []
      end

      def plan
        "markasoftware_free_enterprise_mode"
      end

      def features
        []
      end
      
      def version
        69
      end
    end.new
  end

  def will_expire?
    false
  end

  def mail
    "admin@example.com"
  end

  def subscriber
    "markasoftware-free-enterprise-mode"
  end

  def company
    "markasoftware"
  end

  def domain
    "markasoftware.com"
  end

  def issued_at
    Time.zone.today - 1
  end

  def starts_at
    Time.zone.today - 1
  end

  def expires_at
    Time.zone.today + 1
  end

  def reprieve_days
    nil
  end

  def reprieve_days_left
    69
  end

  def restrictions
    nil
  end

  def available_features
    []
  end

  def plan
    "markasoftware_free_enterprise_mode"
  end

  def features
    []
  end
  
  def version
    69
  end

  def allows_to?(action)
    true
  end

  def expired?(reprieve: true)
    false
  end

  def invalid_domain?
    false
  end
end

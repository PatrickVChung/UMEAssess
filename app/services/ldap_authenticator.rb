require 'net/ldap'

class LdapAuthenticator
  # OHSU LDAP Constants
  LDAP_HOST = 'ldap.ohsu.edu'
  LDAP_PORT = 389
  LDAP_BASE = 'DC=ohsum01,DC=ohsu,DC=edu'
  
  # The account used to "look up" users initially
  ADMIN_USER = "CN=svcLDAPFamilyMedicine,OU=Service Accounts,OU=Special Accounts,DC=ohsum01,DC=ohsu,DC=edu"
  ADMIN_PASS = 'molt6*pate' # Move this to credentials.yml.enc later!

  def self.valid_credentials?(username, password)
    return false if password.blank?

    ldap = Net::LDAP.new(host: LDAP_HOST, port: LDAP_PORT)
    ldap.auth ADMIN_USER, ADMIN_PASS

    if ldap.bind
      # Search for the user's specific Distinguished Name (DN)
      filter = Net::LDAP::Filter.eq("sAMAccountName", username)
      entry = ldap.search(base: LDAP_BASE, filter: filter).first

      if entry
        # Now try to BIND as the actual user using the password they typed
        user_auth = Net::LDAP.new(
          host: LDAP_HOST, 
          port: LDAP_PORT, 
          auth: { method: :simple, username: entry.dn, password: password }
        )
        return entry if user_auth.bind
      end
    end
    false
  rescue => e
    Rails.logger.error "LDAP Error: #{e.message}"
    false
  end
end

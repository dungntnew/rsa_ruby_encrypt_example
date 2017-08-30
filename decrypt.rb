#!/usr/bin/env ruby

require 'openssl'
require 'base64'

private_key_file = 'private.pem';
password = 'abcd1234'

encrypted_string = %Q{
AW2+xZkKQVj8vDs+iObrDU2I+JDl9KF0bCpL3eUTtHSRvH/CtIJpInGiqwtJ
AVhnrEBkUY5SOhM2JZL5w/8OdsDDle0K7iXyPOnJADaFl6MVeYox/O4qwDtV
p/b3aPcebW5hTG7gh/oXzpkDvH8qqRp9lp8r+dN2u51aZjdfc8PftwyncCsR
Gg4hHsTL7uO5U6vS41EpSXHzGyTwp3tVPToM3O1+e8fiv7V89oYV0iVP+ZuG
KWoAZCvPEUC/4BusDy7jGTc3YH4RrYDAMuYkolKZ+8hLchEzaIWgDnN+AHnh
yZti9slr2VbHDGB/1vw1wyv11VHRYHjFS/PI1vCHHg==
}

private_key =
  OpenSSL::PKey::RSA.new(File.read(private_key_file),password)

string =
  private_key.private_decrypt(Base64.decode64(encrypted_string))

print string, "\n"

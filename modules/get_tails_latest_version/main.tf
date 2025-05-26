# 
# There are two ways to get the latest tails version 
# 
# 1. Query the tail git repository for the latest tag 
# 2. Check the release RSS feed 
# 
# Using the RSS feed as there may be a delay between the release on 
# the tails repository and the official release 
#

data "http" "tails_rss" {

  url = "https://tails.net/doc/upgrade/release_notes/index.en.rss"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status ${self.status_code} code invalid"
    }
  }

}

#
# There isn't a good way to parse ( as far as I know ) a RSS feed in
# terrafrom. Using a shell script for now
#

data "external" "get_tails_latest_version" {

     query = {

        rss_base64=data.http.tails_rss.response_body_base64

     }

     program = [ "bash", "${path.module}/scripts/get_tails_latest_version.sh" ]
}

output "tails_version" {

  value = "${data.external.get_tails_latest_version.result.version}"

}

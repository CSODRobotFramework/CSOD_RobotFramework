# These next imports for reporting Test status to Sauce Labs
import sys
import httplib
import base64

try:
    import json
except ImportError:
    import simplejson as json


def __init__(self):
        print 'saucelabs test status library'


    #Config to connect to SauceLabs REST API
config = {"username": "yourusernamehere",
          "access-key": "youraccesskeyhere"}


    # Curl call to SauceLabs API to report Job Result
def set_test_status(self, jobid, passed):
    base64string = base64.encodestring('%s:%s' % (config['username'], config['access-key']))[:-1]
    body_content = json.dumps({"passed": passed})
    connection = httplib.HTTPConnection("saucelabs.com")
    connection.request('PUT', '/rest/v1/%s/jobs/%s' % (config['username'], jobid),
                   body_content,
                   headers={"Authorization": "Basic %s" % base64string})
    result = connection.getresponse()
    return result.status == 200


def tearDown(self):
    # sys.exc_info should be (None, None, None) if everything is OK, it fills with some values if something went wrong
    # This if reports to Sauce Labs the outcome of the Test where True = Pass and False = Failed
    if sys.exc_info() == (None, None, None):
        self.set_test_status(self.driver.session_id, True)
    else:
        self.set_test_status(self.driver.session_id, False)
    self.driver.quit()
    self.assertEqual([], self.verificationErrors)
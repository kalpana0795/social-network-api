# README

* Ruby Version 2.6.1

* Rails Version 5.2.4

#### Instructions

* Clone the git repository
* Install ruby-2.6.1
* Run the command `bundle install`
* Run the test suite using `bundle exec rspec` to confirm if the setup is successful.
* Start the rails server using `bundle exec puma`
* Test the output using `curl localhost:3000`

## ApacheBench Report

<table >
<tr ><th colspan=2 bgcolor=white>Server Software:</th><td colspan=2 bgcolor=white></td></tr>
<tr ><th colspan=2 bgcolor=white>Server Hostname:</th><td colspan=2 bgcolor=white>localhost</td></tr>
<tr ><th colspan=2 bgcolor=white>Server Port:</th><td colspan=2 bgcolor=white>3000</td></tr>
<tr ><th colspan=2 bgcolor=white>Document Path:</th><td colspan=2 bgcolor=white>/</td></tr>
<tr ><th colspan=2 bgcolor=white>Document Length:</th><td colspan=2 bgcolor=white>Variable</td></tr>
<tr ><th colspan=2 bgcolor=white>Concurrency Level:</th><td colspan=2 bgcolor=white>10</td></tr>
<tr ><th colspan=2 bgcolor=white>Time taken for tests:</th><td colspan=2 bgcolor=white>49.206 seconds</td></tr>
<tr ><th colspan=2 bgcolor=white>Complete requests:</th><td colspan=2 bgcolor=white>1000</td></tr>
<tr ><th colspan=2 bgcolor=white>Failed requests:</th><td colspan=2 bgcolor=white>0</td></tr>
<tr ><th colspan=2 bgcolor=white>Total transferred:</th><td colspan=2 bgcolor=white>650936 bytes</td></tr>
<tr ><th colspan=2 bgcolor=white>HTML transferred:</th><td colspan=2 bgcolor=white>415936 bytes</td></tr>
<tr ><th colspan=2 bgcolor=white>Requests per second:</th><td colspan=2 bgcolor=white>20.32</td></tr>
<tr ><th colspan=2 bgcolor=white>Transfer rate:</th><td colspan=2 bgcolor=white>12.92 kb/s received</td></tr>
<tr ><th bgcolor=white colspan=4>Connnection Times (ms)</th></tr>
<tr ><th bgcolor=white>&nbsp;</th> <th bgcolor=white>min</th>   <th bgcolor=white>avg</th>   <th bgcolor=white>max</th></tr>
<tr ><th bgcolor=white>Connect:</th><td bgcolor=white>    0</td><td bgcolor=white>    0</td><td bgcolor=white>    6</td></tr>
<tr ><th bgcolor=white>Processing:</th><td bgcolor=white>  398</td><td bgcolor=white>  488</td><td bgcolor=white> 1207</td></tr>
<tr ><th bgcolor=white>Total:</th><td bgcolor=white>  398</td><td bgcolor=white>  488</td><td bgcolor=white> 1213</td></tr>
</table>

#### Details

* API for fetching feed data from takehome.io social network endpoints
* Supported social media platforms: Facebook, twitter, instagram
* Expected output from the takehome.io endpoint is a valid JSON for success case
* If the response code is 200, the response is parsed to get the desired values (ex. satuses for facebook)
* In case the response code is not 200 for a request to a particular social network which indicates something might be wrong, the following value is added corresponding to the social network in the application's response: `[{ error_message: 'Something went wrong.' }]`
* Connection timeouts are also handled explicitly and the error message in that case being
`[{ error_message: 'Connection timed out.' }]`

#### Future Enhancements

* Enhance existing specs to test multithreaded data fetch logic.
* Tools such as JRuby can be considered to achieve better parallelization.
* Error notifiers can be integrated as well as error classes can be introduced.

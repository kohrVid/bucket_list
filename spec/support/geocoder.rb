Geocoder.configure(:lookup => :test)
Geocoder::Lookup::Test.add_stub(
  "Hoddesdon, United Kingdom", [
    {
      'latitude'     => 51.76000699999999,
      'longitude'    => -0.015042,
      'address'      => 'Hoddesdon, UK',
      'state'        => 'England',
      'state_code'   => '',
      'city'	    =>  'Hoddesdon',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)


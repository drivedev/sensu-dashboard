![sensu](https://raw.github.com/sensu/sensu/master/sensu-logo.png)

A front-end dashboard for the Sensu monitoring framework.

## Documentation
  Please refer to the [Sensu Wiki](https://github.com/sensu/sensu-dashboard/wiki).
  
  The sensu-dashboard may connect to multiple sensu-api backends, which are displayed as a dropdown in the nav bar.
  Backends are declared in the 'backends' config item:
```
{
  ...
  "backends" => {
    "global_name" => "global_backend",
    "other_backends" => [
      {
        "name" => "backend_01",
        "config" => {
          "api" => {
            "host" => "192.168.100.11",
            "port" => 4567
          }
        }
      },
      {
        "name" => "backend_02",
        "config" => {
          "api" => {
            "host" => "192.168.100.12",
            "port" => 4567
          }
        }
      }
    ]
  }
}
```
  If the 'backends' config item is missing or there are no 'other_backends' declared, no backend selection dropdown is displayed.

## License
  Sensu is released under the [MIT license](https://raw.github.com/sensu/sensu-dashboard/master/MIT-LICENSE.txt).

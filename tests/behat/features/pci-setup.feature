Feature: Test that setup is good

  Scenario: Plugin setup is as expected
    Given a WP install with the Plugin Check Internal plugin

    When I run the WP-CLI command `plugin list --format=csv --fields=name,status`
    Then STDOUT should contain:
      """
      plugin-check,active
      """
    And STDOUT should contain:
      """
      plugin-check-internal,active
      """

    When I run the WP-CLI command `plugin list-checks --format=csv --fields=slug,category`
    Then STDOUT should contain:
      """
      plugin_urls,plugin_internal
      """

    When I run the WP-CLI command `plugin list-check-categories --format=csv --fields=name,slug`
    Then STDOUT should contain:
      """
      "Plugin Internal",plugin_internal
      """

    When I run the WP-CLI command `help plugin check`
    Then STDOUT should not be empty
    And STDERR should be empty

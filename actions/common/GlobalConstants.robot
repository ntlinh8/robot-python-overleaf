*** Variables ***
${sleep_timeout}                2s

${retry_timeout}                30s
${retry_interval_timeout}       3s

${implicit_short_timeout}       5s
${implicit_long_timeout}        30s

${environment}    test
${browser}        Chrome
${base_url}       ${${environment}_url}
${dev_url}        https://www.overleaf.com/
${staging_url}    https://www.overleaf.com/
${test_url}       https://www.overleaf.com/

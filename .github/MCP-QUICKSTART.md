```json
{
    "servers": {
        "laravel-boost-wicred-clients": {
            "command": "docker",
            "args": [
                "exec",
                "-i",
                "wicred-clients-laravel.test-1",
                "php",
                "/var/www/html/artisan",
                "boost:mcp"
            ]
        }
    }
}
```



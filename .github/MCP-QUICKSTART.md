```json
{
    "servers": {
        "laravel-boost-wicred-web": {
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



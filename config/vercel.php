<?php

// In config/database.php, after the connections array
if (env('VERCEL', false)) {
    Config::set('database.default', 'pgsql');
    Config::set('database.connections.pgsql.host', env('DB_HOST'));
    Config::set('database.connections.pgsql.database', env('DB_DATABASE'));
    Config::set('database.connections.pgsql.username', env('DB_USERNAME'));
    Config::set('database.connections.pgsql.password', env('DB_PASSWORD'));
    Config::set('database.connections.pgsql.sslmode', 'require');
}
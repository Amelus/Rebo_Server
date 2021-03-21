const winston = require('winston')

const options = {
    file: {
        level: 'info',
        filename: '/usr/bazaar/logs/nodejs_server.log',
        handleExceptions: true,
        json: true,
        maxsize: 5242880, // 5MB
        maxFiles: 5,
        colorize: true,
    },
    console: {
        level: 'debug',
        handleExceptions: true,
        json: false,
        colorize: true,
    },
};

const logger = winston.createLogger({
    levels: winston.config.npm.levels,
    transports: [
        new winston.transports.File(options.file),
        new winston.transports.Console(options.console)
    ],
    exitOnError: false
})

module.exports = logger
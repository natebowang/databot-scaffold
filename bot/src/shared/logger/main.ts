import DailyRotateFile from 'winston-daily-rotate-file'
import { createLogger, format, transports } from 'winston'
import { envVar } from '../config/envVar/main'

const isProd = envVar.ENV_NAME === 'prod'

export const logger = createLogger({
  level: envVar.LOG_LEVEL,
  transports: [
    new transports.Console({
      format: format.combine(
        format.colorize({ all: true }),
        format.timestamp(),
        format.printf((info) => {
          const { timestamp, level, message, ...args } = info
          return `${timestamp} ${level}: ${message} ${
            Object.keys(args).length ? JSON.stringify(args, null, 2) : ''
          }`
        }),
      ),
    }),
    new DailyRotateFile({
      datePattern: 'YYYY-MM-DD-HH',
      filename: envVar.LOG_FILE_PATH_FROM_BOT,
      format: format.combine(format.timestamp(), format.json()),
      maxFiles: isProd ? '3d' : '10',
      maxSize: '1m',
      utc: isProd,
      zippedArchive: isProd,
    }),
  ],
})

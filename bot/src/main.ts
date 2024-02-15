import { logger } from './shared/logger/main'
import { setInterval } from 'timers'

let t = 0

setInterval(() => {
  logger.http(`${t++} Hello World`)
  logger.warn(`${t++} Hello World`)
  logger.debug(`${t++} Hello World`)
  logger.error(`${t++} Hello World`)
  logger.info(`${t++} Hello World`)
}, 40)

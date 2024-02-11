import { logger } from './shared/logger/main'
import { setInterval } from 'timers'

setInterval(() => {
  logger.trace('Hello World')
}, 1000)

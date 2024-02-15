import { logger } from './shared/logger/main'
import { setInterval } from 'timers'

let t = 0

setInterval(() => {
  logger.trace({ t: t++ }, 'Hello World')
}, 10)

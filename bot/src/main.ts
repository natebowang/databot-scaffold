import { logger } from './shared/logger/main'
import { setInterval } from 'timers'

let t = 0

setInterval(() => {
  logger.http(`${t++} Hello World`)
  logger.info('hello', { obj: 'more', ano: 3, nest: { a: 'seg' } })
}, 40)

import { envVar } from '../config/envVar/main'
import { pino } from 'pino'

export const logger = pino({
  level: envVar.LOG_LEVEL ?? 'debug',
})

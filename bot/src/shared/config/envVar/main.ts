export type EnvVar = {
  ENV_NAME: 'local' | 'prod'
  LOG_LEVEL: 'fatal' | 'error' | 'warn' | 'info' | 'debug' | 'trace'
  LOG_FILE_PATH_FROM_BOT: string
}

export const envVar = process.env as EnvVar

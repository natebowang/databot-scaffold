export type EnvVar = {
  ENV_NAME: 'local' | 'prod'
  LOG_LEVEL: 'error' | 'warn' | 'info' | 'http' | 'verbose' | 'debug' | 'silly'
  LOG_FILE_PATH_FROM_BOT: string
}

export const envVar = process.env as EnvVar

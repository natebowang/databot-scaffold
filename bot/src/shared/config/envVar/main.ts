export type EnvVar = {
  ENV_NAME: 'local' | 'prod'
  LOG_LEVEL?:'fatal' | 'error' | 'warn' | 'info' | 'debug' | 'trace'
}

export const envVar = process.env as EnvVar


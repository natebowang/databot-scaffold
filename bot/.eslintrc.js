module.exports = {
  env: {
    es2020: true,
    node: true,
    jest: true,
  },
  parser: '@typescript-eslint/parser',
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:import/typescript',
    'prettier',
  ],
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
  },
  settings: {
    'import/resolver': {
      typescript: {},
    },
  },
  plugins: [
    '@typescript-eslint',
    'sort-destructure-keys',
    'sort-imports-es6-autofix',
    'import',
  ],
  ignorePatterns: ['dist/'],
  rules: {
    'no-case-declarations': 'off',
    'node/no-unsupported-features/es-syntax': 'off',
    'sort-destructure-keys/sort-destructure-keys': [
      'warn',
      { caseSensitive: false },
    ],
    'sort-imports-es6-autofix/sort-imports-es6': [
      'warn',
      {
        ignoreCase: false,
        // ignoreMemberSort: false,
        // memberSyntaxSortOrder: ['none', 'all', 'multiple', 'single'],
      },
    ],
    'no-fallthrough': ['error', { allowEmptyCase: true }],
    '@typescript-eslint/no-explicit-any': 'off',
    '@typescript-eslint/no-non-null-assertion': 'off',
  },
}

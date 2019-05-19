module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint',
    sourceType: 'module'
  },
  env: {
    browser: true,
  },
  overrides: [
    {
      files: ['**.spec.js'],
      rules: {
        'quote-props': ["error", "consistent"],
        'max-len': 'off',
        'vue/require-v-for-key': 'off',
      }
    },
  ],
};

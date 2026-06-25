module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', [
      'fix',
      'feat',
      'docs',
      'ci',
      'chore',
      'test',
      'refactor',
      'style',
      'perf',
      'build',
      'revert'
    ]],
  },
};

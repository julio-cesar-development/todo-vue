import capitalize from '@/utils/Capitalize';

describe('capitalize', () => {
  it('capitalize should always return the string capitalized', () => {
    // valid string
    expect(capitalize('test test')).toBe('Test test');

    // incorrect values
    expect(capitalize('')).toBe('');
    expect(capitalize(null)).toBe('');
    expect(capitalize(undefined)).toBe('');
    expect(capitalize(false)).toBe('');
    expect(capitalize({})).toBe('');
  });
});

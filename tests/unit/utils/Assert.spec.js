import { assertInt, assertFloat } from '@/utils/Assert';

describe('assertInt', () => {
  it('assertInt should always return a valid integer number', () => {
    // incorrect values
    expect(assertInt('')).toBe(0);
    expect(assertInt(null)).toBe(0);
    expect(assertInt(undefined)).toBe(0);
    expect(assertInt(false)).toBe(0);
    expect(assertInt({})).toBe(0);

    // numbers
    expect(assertInt(0)).toBe(0);
    expect(assertInt(1)).toBe(1);
    expect(assertInt(1.9999)).toBe(1);
  });
});

describe('assertFloat', () => {
  it('assertFloat should always return a valid float number', () => {
    // incorrect values
    expect(assertFloat('')).toBe(0);
    expect(assertFloat(null)).toBe(0);
    expect(assertFloat(undefined)).toBe(0);
    expect(assertFloat(false)).toBe(0);
    expect(assertFloat({})).toBe(0);

    // numbers
    expect(assertFloat(0)).toBe(0);
    expect(assertFloat(1)).toBe(1);
    expect(assertFloat(1.9999)).toBe(1.9999);
  });
});
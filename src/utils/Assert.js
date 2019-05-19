/**
 * @param {*} value
 * @returns the parse integer of the value even if the value is invalid as integer number
 */
export const assertInt = (value) => {
  if (value === undefined || value === null || value === ''
    || Number.isNaN(value) || Number.isNaN(parseInt(value, 10))) {
    return 0;
  }
  return parseInt(value, 10);
};

/**
 * @param {*} value
 * @returns the parse float of the value even if the value is invalid as float number
 */
export const assertFloat = (value) => {
  if (value === undefined || value === null || value === ''
    || Number.isNaN(value) || Number.isNaN(parseFloat(value))) {
    return 0.00;
  }
  return parseFloat(value);
};

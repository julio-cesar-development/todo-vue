/**
 * @param {*} str
 * @returns the string capitalized
 */
export const capitalize = (str) => {
  if (!str) {
    return '';
  }
  str = str.toString();
  return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
};

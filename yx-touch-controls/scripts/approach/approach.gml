/// @description Shifts the start value towards end, by step
/// @function approach
/// @param {number} start Starting value
/// @param {number} end Target value
/// @param {number} step Step value to shift towards end
if (argument[0] > argument[1]) {
    return max(argument[0] - argument[2], argument[1]);
} else {
    return min(argument[0] + argument[2], argument[1]);
}

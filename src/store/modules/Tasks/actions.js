/* eslint-disable import/prefer-default-export */
export const actions = {
  setTasks(context, tasks) {
    context.commit('setTasks', tasks);
  },
  addTask(context, task) {
    context.commit('addTask', task);
  },
  deleteTask(context, idx) {
    context.commit('deleteTask', idx);
  },
  changeTaskState(context, idx) {
    context.commit('changeTaskState', idx);
  },
};

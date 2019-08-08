/* eslint-disable import/prefer-default-export */
/* eslint-disable no-param-reassign */
export const mutations = {
  setTasks(state, tasks) {
    state.tasks = tasks;
  },
  addTask(state, task) {
    if (task.name) {
      const { tasks } = state;
      const isNew = state.tasks.filter(
        t => t.name.toString().toLowerCase() === task.name.toString().toLowerCase(),
      ).length === 0;
      if (isNew) {
        tasks.push({
          name: task.name.toString(),
          pending: task.pending || true,
        });
      }
      state.tasks = tasks;
    }
  },
  deleteTask(state, idx) {
    const { tasks } = state;
    tasks.splice(idx, 1);
    state.tasks = tasks;
  },
  changeTaskState(state, idx) {
    const { tasks } = state;
    tasks[idx].pending = !tasks[idx].pending;
    state.tasks = tasks;
  },
};

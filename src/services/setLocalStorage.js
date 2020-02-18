export const setTasksToLocalStorage = (tasks) => {
  /* eslint-disable no-param-reassign */
  if (tasks) {
    if (!Array.isArray(tasks)) {
      tasks = [];
    }
    localStorage.setItem('tasks', JSON.stringify(tasks));
  } else {
    localStorage.setItem('tasks', JSON.stringify([]));
  }
};

export const getTasksFromLocalStorage = () => {
  if (localStorage.getItem('tasks')) {
    const tasks = JSON.parse(localStorage.getItem('tasks'));
    return Array.isArray(tasks) ? tasks : [];
  }
  setTasksToLocalStorage();
  return [];
};

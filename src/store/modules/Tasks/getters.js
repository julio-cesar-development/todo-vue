import { assertInt } from '@/utils/Assert';

/* eslint-disable import/prefer-default-export */
export const getters = {
  tasksProgress(state) {
    const total = state.tasks.length;
    const done = state.tasks.filter(t => !t.pending).length;
    const calc = assertInt(done) / assertInt(total);
    return (calc || 0) * 100;
  },
  tasksDone(state) {
    return state.tasks.filter(t => !t.pending);
  },
};

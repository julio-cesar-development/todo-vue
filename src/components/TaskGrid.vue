<template>
  <div class="task-grid">
    <template v-if="tasks && tasks.length">
      <task v-for="(task, idx) in tasks"
        v-bind:task="task"
        v-bind:key="task.name"
        v-on:task-deleted="deleteTask(idx)"
        v-on:task-state-changed="changeTaskState(idx)"
      />
    </template>
    <template v-else>
      <div>
        <p class="no-task">Nenhuma task 😀</p>
      </div>
    </template>
  </div>
</template>

<script>
import Task from '@/components/Task.vue';

export default {
  name: 'TaskGrid',
  components: {
    Task,
  },
  data() {
    return {
      value: '',
    };
  },
  props: {
    tasks: {
      type: Array,
      required: true,
    },
  },
  methods: {
    deleteTask(index) {
      if (index !== undefined && index !== null && index !== '') {
        this.$emit('task-deleted', index);
      }
    },
    changeTaskState(index) {
      if (index !== undefined && index !== null && index !== '') {
        this.$emit('task-state-changed', index);
      }
    },
  },
};
</script>

<style scoped>
.task-grid {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  padding: 10px;
}

.task-grid .task {
  margin: 10px;
}

.no-task {
  color: #bbb;
  font-size: 1.8em;
}
</style>

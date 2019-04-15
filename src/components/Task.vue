<template>
  <div class="task" v-bind:class="stateClass" v-on:click.stop="changeTaskState()">
    <span class="close" v-on:click.stop="deleteTask()">X</span>
    <span>
      {{ task.name }}
    </span>
  </div>
</template>

<script>
export default {
  name: 'Task',
  props: {
    task: {
      type: Object,
      required: true,
    }
  },
  computed: {
    stateClass() {
      return {
        pending: this.task.pending,
        done: !this.task.pending,
      }
    },
  },
  methods: {
    deleteTask() {
      this.$emit('task-deleted', this.task);
    },
    changeTaskState() {
      this.$emit('task-state-changed', this.task);
    },
  },
}
</script>

<style scoped>
.task {
  box-sizing: border-box;
  width: 280px;
  height: 100px;
  padding: 10px;
  border-radius: 0.3em;
  font-size: 1.2em;
  font-weight: 300;
  cursor: pointer;
  user-select: none;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  transition: .5s;
}

.pending {
  border-left: 8px solid #b73228;
  background-color: #f44336;
}

.done {
  color: #ddd;
  border-left: 8px solid #0a8f08;
  background-color: #4caf50;
  text-decoration: line-through;
}

.close {
  box-sizing: border-box;
  position: absolute;
  top: 10px;
  right: 10px;
  border-radius: 50%;
  height: 20px;
  width: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 0.8em;
  font-weight: bold;
  cursor: pointer;
  transition: .5s;
}

.pending .close {
  background-color: #b73229;
}

.done .close {
  background-color: #0a8f08;
}
</style>

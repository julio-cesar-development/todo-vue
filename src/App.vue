<template>
  <div id="app">
    <h1>{{ 'tarefas' | capitalize }}</h1>
    <div class="wrapper">
      <task-progress-bar v-bind:progress="progress" />
      <task-new v-on:task-added="addTask($event)" />
      <task-grid
        v-bind:tasks="tasks"
        v-on:task-deleted="deleteTask($event)"
        v-on:task-state-changed="changeTaskState($event)"
      />
    </div>
  </div>
</template>

<script>
import TaskGrid from '@/components/TaskGrid';
import TaskNew from '@/components/TaskNew';
import TaskProgressBar from '@/components/TaskProgressBar';
import { assertInt } from '@/utils/Assert.js';

export default {
  name: 'App',
  components: {
    TaskGrid,
    TaskNew,
    TaskProgressBar,
  },
  data() {
    return {
      tasks: [],
    }
  },
  computed: {
    progress() {
      const total = this.tasks.length;
      const done = this.tasks.filter(t => !t.pending).length;
      const calc = assertInt(done) / assertInt(total);
      return (calc || 0) * 100;
    }
  },
  watch: {
    tasks: {
      handler() {
        this.setLocalStorage(this.tasks);
      },
      deep: true,
    },
  },
  mounted() {
    this.tasks = this.getLocalStorage();
  },
  methods: {
    addTask(task) {
      if (task.name) {
        const isNew = this.tasks.filter(t => t.name.toString().toLowerCase() === task.name.toString().toLowerCase()).length === 0;
        isNew && this.tasks.push({
          'name': task.name.toString(),
          'pending': task.pending || true,
        });
      }
    },
    deleteTask(idx) {
      this.tasks.splice(idx, 1);
    },
    changeTaskState(idx) {
      this.tasks[idx].pending = !this.tasks[idx].pending;
    },
    setLocalStorage(tasks) {
      if (tasks) {
        if (!Array.isArray(tasks)) {
          tasks = [];
        }
        localStorage.setItem('tasks', JSON.stringify(tasks));
      } else {
        localStorage.setItem('tasks', JSON.stringify([]));
      }
    },
    getLocalStorage() {
      if (localStorage.getItem('tasks')) {
        let tasks = JSON.parse(localStorage.getItem('tasks'));
        return Array.isArray(tasks) ? tasks : [];
      }
      this.setLocalStorage();
      return [];
    },
  },
}
</script>

<style>
body {
  font-family: 'Lato', 'Calibri', 'sans-serif';
  background: linear-gradient(to right, rgb(22, 34, 42), rgb(58, 96, 115));
  color: #FFF;
  margin: 0px;
}

@font-face {
  font-family: Collona;
  src: url('/fonts/sudbury_basin.ttf');
}

#app {
  min-height: calc(100vh - 30px);
  margin: 0px;
}

#app h1 {
  font-weight: 300;
  font-size: 3rem;
  text-align: center;
  margin-left: 0px;
  margin-right: 0px;
  margin-top: 30px;
  margin-bottom: 30px;
  height: 50px;
  font-family: 'Collona', 'Germania One', 'Calibri', 'sans-serif';
}

.wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 110px);
  position: relative;
}

.btn, .form-input {
  box-sizing: border-box;
  outline: none;
  border: none;
  height: 30px;
  padding: 5px;
  text-align: center;
}

.btn {
  border-radius: 0 1rem 1rem 0;
  box-shadow: 0 0 20px 5px rgba(255, 255, 255, .1);
  width: 30px;
  display: block;
  cursor: pointer;
  background-color: #aaa;
  font-size: 1.2em;
  font-weight: bold;
}

.form-input {
  border-radius: 1rem 0 0 1rem;
  box-shadow: 0 0 20px 5px rgba(255, 255, 255, .1);
  background-color: #ddd;
}
</style>

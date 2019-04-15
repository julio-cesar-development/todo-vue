<template>
	<div id="app">
		<h1>Tarefas</h1>
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

export default {
  name: 'App',
  components: {
    TaskGrid,
    TaskNew,
    TaskProgressBar,
  },
  directives: {},
  filters: {},
  mixins: [],
  props: {

  },
  data() {
    return {
      tasks: [
        // { 'name': 'lavar roupa', 'pending': false },
        // { 'name': 'estudar', 'pending': true },
      ]
    }
  },
  computed: {
    progress() {
      const total = this.tasks.length;
      const done = this.tasks.filter(t => !t.pending).length;
      const calc = this.assertint(done) / this.assertint(total);
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
  beforeCreate() {},
  created() {},
  beforeMount() {},
  mounted() {
    this.tasks = this.getLocalStorage();
  },
  beforeUpdate() {},
  updated() {},
  activated() {},
  deactivated() {},
  beforeDestroy() {},
  destroyed() {},
  methods: {
    assertint(value) {
      if (!value) {
        return 0;
      }
      value = parseInt(value, 10);
      value = !isNaN(value) ? value : 0;
      return value;
    },
    addTask(task) {
      if (task.name) {
        const isNew = this.tasks.filter(t => t.name.toString().toLowerCase() === task.name.toString().toLowerCase()).length === 0;
        // console.log(task); // eslint-disable-line
        isNew && this.tasks.push({
          'name': task.name.toString().toLowerCase(),
          'pending': task.pending || true,
        });
        // this.setLocalStorage(this.tasks);
      }
    },
    deleteTask(idx) {
      // console.log(idx); // eslint-disable-line
      this.tasks.splice(idx, 1);
      // this.setLocalStorage(this.tasks);
    },
    changeTaskState(idx) {
      this.tasks[idx].pending = !this.tasks[idx].pending;
      // this.setLocalStorage(this.tasks);
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
  font-family: 'Lato', sans-serif;
  background: linear-gradient(to right, rgb(22, 34, 42), rgb(58, 96, 115));
  color: #FFF;
  margin: 0px;
}

#app {
  height: 100vh;
  margin: 0px;
}

#app h1 {
  font-weight: 300;
  font-size: 3rem;
  text-align: center;
  margin: 0px;
  height: 50px;
  font-family: 'Germania One', 'Calibri', 'sans-serif';
}

.wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 50px);
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

/* .form-input:focus {
  background-color: #000;
  color: #fff;
} */
</style>

<template>
  <div id="app">
    <h1>{{ 'tarefas V2' | capitalize }}</h1>
    <div class="wrapper">
      <task-progress-bar v-bind:progress="tasksProgress" />
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
import { mapState, mapGetters } from 'vuex';
import TaskGrid from '@/components/TaskGrid.vue';
import TaskNew from '@/components/TaskNew.vue';
import TaskProgressBar from '@/components/TaskProgressBar.vue';
import { setTasksToLocalStorage, getTasksFromLocalStorage } from '@/services/setLocalStorage';

export default {
  name: 'App',
  components: {
    TaskGrid,
    TaskNew,
    TaskProgressBar,
  },
  computed: {
    ...mapState({
      tasks: state => state.Tasks.tasks,
    }),
    ...mapGetters('Tasks', ['tasksProgress']),
  },
  watch: {
    tasks: {
      handler() {
        setTasksToLocalStorage(this.tasks);
      },
      deep: true,
    },
  },
  mounted() {
    const tasks = getTasksFromLocalStorage();
    this.$store.dispatch('Tasks/setTasks', tasks);
  },
  methods: {
    addTask(task) {
      this.$store.dispatch('Tasks/addTask', task);
    },
    deleteTask(idx) {
      this.$store.dispatch('Tasks/deleteTask', idx);
    },
    changeTaskState(idx) {
      this.$store.dispatch('Tasks/changeTaskState', idx);
    },
  },
};
</script>

<style>
body {
  font-family: 'Lato', 'Calibri', 'sans-serif';
  background: linear-gradient(to right, rgb(30, 30, 50), rgb(58, 96, 115));
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

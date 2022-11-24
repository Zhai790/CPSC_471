const routes=[
    {path:'/home', component: home},
    {path:'/admin', component: admin},
    {path:'/booking', component: booking}
];

const router = VueRouter.createRouter({
    history: VueRouter.createWebHashHistory(),
    routes, // short for `routes: routes`
  })

const app = Vue.createApp({});

app.use(router);

app.mount('#app');  
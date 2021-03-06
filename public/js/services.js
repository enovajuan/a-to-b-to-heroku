/**
 * Created by jbonfante on 8/26/14.
 */


bombApp.factory("Bomb", function($resource) {
    return $resource("/api/bomb",{},
        {
            'activate':  { method: 'GET' , url:"/api/bomb/:id/activate/:activation_code", params:{id: "@bomb_id", activation_code:"@activation_code"}},
            'deactivate':  { method: 'GET', url:"/api/bomb/:id/deactivate/:deactivation_code", params:{id: "@bomb_id", deactivation_code:"@deactivationEntry"} },
            'submit': {method: 'POST', isObject:true},
            'detonate':  { method: 'GET', url:"/api/bomb/detonate/:id", params:{id:"@bomb_id"} },
            'cut':  { method: 'GET', url:"/api/bomb/cut/:id/:wire_id", params:{id:"@bomb_id", wire_id:"@wire_id"} },
            'index':   { method: 'GET', isArray: true },
            'show':    { method: 'GET', isArray: false },
            'update':  { method: 'PUT' },
            'explode': { method: 'GET' }
        }
    );
});
// Configuración global de toastr
toastr.options = {
    "closeButton": false,
    "debug": true,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };

  /**
   * Muestra un mensaje de toastr.
   * @param {string} type - Tipo de mensaje: 'success', 'error', 'warning', 'info'.
   * @param {string} message - Contenido del mensaje.
   * @param {string} title - Título del mensaje (opcional).
   */
  function showToastrMessage(type, message, title = '') {
    switch (type) {
      case 'success':
        toastr.success(message, title);
        break;
      case 'error':
        toastr.error(message, title);
        break;
      case 'warning':
        toastr.warning(message, title);
        break;
      case 'info':
        toastr.info(message, title);
        break;
      default:
        console.error('Tipo de mensaje no válido:', type);
    }
  }
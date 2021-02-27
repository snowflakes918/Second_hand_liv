/*!
 * FileInput Chinese Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 * @author kangqf <kangqingfei@gmail.com>
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";

    $.fn.fileinputLocales['zh'] = {
        fileSingle: 'File',
        filePlural: ' Files',
        browseLabel: 'choose &hellip;',
        removeLabel: 'remove',
        removeTitle: 'remove chosen File',
        cancelLabel: 'Cancel',
        cancelTitle: 'Cancel',
        uploadLabel: 'U',
        uploadTitle: 'Upload选中File',
        msgNo: 'NONE',
        msgNoFilesSelected: '',
        msgCancelled: 'Cancel',
        msgZoomModalHeading: 'Preview detail',
        msgSizeTooSmall: 'File "{name}" (<b>{size} KB</b>) is too small and must be larger than <b>{minSize} KB</b>.',
        msgSizeTooLarge: 'File "{name}" (<b>{size} KB</b>) exceeds maximum size: <b>{maxSize} KB</b>.',
        msgFilesTooLess: 'Upload at least <b>{n}</b> {files} files ',
        msgFilesTooMany: 'Upload Files <b>({n})</b> exceeds maximum number <b>{m}</b>.',
        msgFileNotFound: 'File "{name}" not found!',
        msgFileSecured: 'Security restrict. Can,t read File "{name}".',
        msgFileNotReadable: 'File "{name}" unreadable.',
        msgFilePreviewAborted: 'Cancel "{name}" preview.',
        msgFilePreviewError: 'Reading "{name}" error.',
        msgInvalidFileName: 'Invalid or unsupported characters in file name "{name}".',
        msgInvalidFileType: 'Invalid type "{name}". Only support "{types}" types of File.',
        msgInvalidFileExtension: 'Incorrect extension "{name}". Only support "{extensions}" extensions.',
        msgFileTypes: {
            'image': 'image',
            'html': 'HTML',
            'text': 'text',
            'video': 'video',
            'audio': 'audio',
            'flash': 'flash',
            'pdf': 'PDF',
            'object': 'object'
        },
        msgUploadAborted: 'FileUpload Abort',
        msgUploadThreshold: 'Processing...',
        msgUploadBegin: 'Initializing...',
        msgUploadEnd: 'Done',
        msgUploadEmpty: 'No valid data available for upload.',
        msgValidationError: 'Validation Error',
        msgLoading: 'Loading {index} File, Total: {files} &hellip;',
        msgProgress: 'Loading file number {index}, Total finished: {files} - {name} - {percent}% 完成.',
        msgSelected: '{n} {files} are chose',
        msgFoldersNotAllowed: 'Drag File here! Skip {n} dragging Folder.',
        msgImageWidthSmall: 'Image "{name}" width at least {size} px.',
        msgImageHeightSmall: 'Image "{name}" height at least {size} px.',
        msgImageWidthLarge: 'Image "{name}" width at most {size} px.',
        msgImageHeightLarge: 'Image "{name}" height at most {size} px.',
        msgImageResizeError: 'Image resize error',
        msgImageResizeException: 'Image resize exception <pre>{errors}</pre>',
        msgAjaxError: 'Something went wrong with the {operation} operation. Please try again later!',
        msgAjaxProgressError: '{operation} failed',
        ajaxOperations: {
            deleteThumb: 'file delete',
            uploadThumb: 'file upload',
            uploadBatch: 'batch file upload',
            uploadExtra: 'form data upload'
        },
        dropZoneTitle: 'Drag files here &hellip;<br> Support multiple files upload',
        dropZoneClickTitle: '<br>(or click {files} button to choose File)',
        fileActionSettings: {
            removeTitle: 'delete File',
            uploadTitle: 'UploadFile',
            zoomTitle: 'Detail',
            dragTitle: 'drag / reset',
            indicatorNewTitle: 'not Upload',
            indicatorSuccessTitle: 'Upload',
            indicatorErrorTitle: 'Upload error',
            indicatorLoadingTitle: 'Uploading ......'
        },
        previewZoomButtonTitles: {
            prev: 'previous File',
            next: 'next File',
            toggleheader: 'Zoom',
            fullscreen: 'Full screen',
            borderless: 'Bordless',
            close: 'Close'
        }
    };
})(window.jQuery);
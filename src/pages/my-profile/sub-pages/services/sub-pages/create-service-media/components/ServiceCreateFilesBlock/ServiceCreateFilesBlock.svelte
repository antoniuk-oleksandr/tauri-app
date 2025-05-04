<script lang="ts">
  import AttachFilesButton from '@/common-components/AttachFilesButton/AttachFilesButton.svelte'
  import OrderSubmitRequirementsFormAttachFileList from '@/pages/order-submit-requirements/components/OrderSubmitRequirementsForm/components/OrderSubmitRequirementsFormAttachFileList/OrderSubmitRequirementsFormAttachFileList.svelte'
  import { orderSubmitRequirementsFormFilesStore } from '@/pages/order-submit-requirements/order-submit-requirements-store'
  import type { CreateServiceFormStore } from '@/types/CreateServiceBasicInfoFormData'
  import { convertFileArrToFileList } from '@/utils/utils'
  import { getContext } from 'svelte'
  import type { Writable } from 'svelte/store'

  const formStore = getContext('formStore') as Writable<CreateServiceFormStore>
  let files = $state<undefined | FileList>()
  formStore.subscribe((value) => (files = value.files))

  const addFiles = (newFiles: FileList) =>
    formStore.update((prev) => {
      const fileList = convertFileArrToFileList([...prev.files, ...Array.from(newFiles)])
      return { ...prev, files: fileList }
    })

  const removeFile = (index: number) =>
    formStore.update((prev) => {
      const files = Array.from(prev.files)
      files.splice(index, 1)
      const fileList = convertFileArrToFileList(files)
      return { ...prev, files: fileList }
    })
</script>

<AttachFilesButton {addFiles} />
{#if files}
  <OrderSubmitRequirementsFormAttachFileList files={Array.from(files)} {removeFile} />
{/if}

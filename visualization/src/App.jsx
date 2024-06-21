import { ApiReferenceReact } from '@scalar/api-reference-react'
import '@scalar/api-reference-react/style.css'
import * as openapi from './openapi.json';

function App() {
  return (
    <ApiReferenceReact
      configuration={{
        spec: {
          content: openapi
        },
      }}
    />
  )
}

export default App
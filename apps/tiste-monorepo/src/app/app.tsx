import styled from '@emotion/styled';

import NxWelcome from './nx-welcome';
import { Orders } from '@tiste-monorepo/orders' 
const StyledApp = styled.div`
  // Your style here
`;

export function App() {
  return (
    <StyledApp>
      <Orders />
    </StyledApp>
  );
}

export default App;

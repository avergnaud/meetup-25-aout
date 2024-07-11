import TodoList from '@/app/components/TodoList';
import MyButton from '@/app/components/MyButton';

export default function Home() {
  return (
    <main>
      <TodoList />
      <hr />
      <MyButton />
      <hr />
      <h2>danger</h2>
      <div dangerouslySetInnerHTML={{
        __html: "<img src='x' onerror='javascript:alert(1)' />"
      }}>
      </div>
    </main>
  );
}
